class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :resumes
         has_many :job_favorites
         has_many :favorite_jobs, through: :job_favorites, source: :job

         def admin?
           is_admin
         end

         def favorite?(job)
           favorite_jobs.include?(job)
         end

         def collect!(job)
           favorite_jobs << job
         end

         def discollect!(job)
           favorite_jobs.delete(job)
         end
end
