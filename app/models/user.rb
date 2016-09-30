class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImageUploader


  def admin?
   	admin
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def send_email_to_dev
    UserMailer.mail_to_dev(self).deliver
  end
end
