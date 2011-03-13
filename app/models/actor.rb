class Actor < ActiveRecord::Base
  has_many :queued_messages
  has_many :handled_messages

  validates_presence_of :name
  validates_format_of   :address, :with => URI::regexp(%w(http https)), :if => :address

  validate :known_contacts_is_json, :if => :known_contacts

  def self.spawn name = nil
    name ||= random_name
    new_actor_object = self.create! :name => name, :status => 'created'

    port = 3000 + new_actor_object.id
    address = "http://localhost:#{port}"

    new_actor_object.address = address
    new_actor_object.save!

    #new_actor_process = fork do
      system "BALE_ACTOR_NAME=#{name} rails s -p #{port}"
    #end
    #Process.detach new_actor_process
  end

  private 

  def known_contacts_is_json
    errors.add(:known_contacts, 'must be valid JSON') unless known_contacts && JSON.parse(known_contacts)
  end

  def self.random_name size = 8
    consonants = %w(b c d f g h j k l m n p qu r s t v w x z ch cr fr nd ng nk nt ph pr rd sh sl sp st th tr lt)
    vowels = %w(a e i o u y)

    (1..size).inject(String.new) do |name, index|
      name << unless index % 2 == 0 then
        consonants[rand * consonants.size]
      else
        vowels[rand * vowels.size]
      end
    end.capitalize
  end

end
