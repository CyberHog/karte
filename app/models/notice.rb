class Notice < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"

  class << self; undef :open; end

  STATUS_VALUES = %w(draft member_only public)

  validates :title, presence: true, length: { maximum: 200 }
  validates :body, :released_at, presence: true
  validates :status, inclusion: { in: STATUS_VALUES }
  validate :check_expired_at
  before_validation :clear_expired_at

  scope :common, -> { where(status: "public") }
  scope :published, -> { where("status <> ?", "draft") }
  scope :full, ->(user) {
  	where("status <> ? OR user_id = ?", "draft", user.id) }
  scope :open, -> {
    now = Time.current
    where("released_at <= ? AND (? < expired_at OR " +
     "expired_at IS NULL)", now, now) }
  scope :readable_for, ->(user) { user ? full(user) : common }

  def no_expiration
    expired_at.blank?
  end

  def no_expiration=(val)
    @no_expiration = val.in?([true, 1, "1"])
  end

  private
  def check_expired_at
    if expired_at && expired_at < released_at
      errors.add(:expired_at, :expired_at_too_old)
    end
  end

  def clear_expired_at
    self.expired_at = nil if @no_expiration
  end

  class << self
  	def status_text(status)
  	  I18n.t("activerecord.attributes.notice.status_#{status}")
  	end

  	def status_options
  	  STATUS_VALUES.map { |status| [status_text(status), status] }
  	end

  	def sidebar_notices(user, num = 5)
  	  readable_for(user).order(released_at: :desc).limit(num)
  	end
  end
end
