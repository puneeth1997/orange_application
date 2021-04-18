class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_attached_file :image , :styles => { large:  "600x600>",medium: "300x300>", thumb: "50x50#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  default_scope {where(is_deleted: false)}


def staff?
  true
end

def to_s
  email
end 


  def self.search(search)
    if search
      where("email LIKE ?","%" + search + "%")
    else
      all
    end
  end


  def self.to_csv
    attributes = %w{id  email points doj}

    CSV.generate do |csv|
      csv << attributes

      all.order(doj: :desc).each do |user|
        csv << user.attributes.values_at(*attributes)
      end
    end
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      # User.create! row.to_hash
     user = find_by_id(row["id"]) || new
     user.attributes =  row.to_hash#.slice(*accessible_attributes)
     user.save!
     end
  end
  
end
