class ExternalService
  has_many :Integrations
  validates :slug, presence: true, unique: true
end
