class Traject < ApplicationRecord
  belongs_to :user
  has_many :stops, dependent: :destroy

  geocoded_by :starting_address
  after_validation :geocode, if: :starting_address_changed?

  validates :starting_address, presence: true

  def create
    @traject = current_user.trajects.build(traject_params)

    if @traject.save
      UserMailer.creation_confirmation(@traject).deliver_now
      redirect_to traject_path(@traject)
    else
      render :new
    end
  end

end
