class Subject < ActiveRecord::Base
	has_many :pages

	validates_presence_of :name, :message => 'Can\'t be blank(nil, false, "", " ", [],or {})'
	validates_length_of :name, :maximum => 255


	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("subjects.position ASC") }
	scope :newest_first, lambda { order("subjects.created_at DESC") }
	scope :search, lambda {|t| where(["subjects.name like ?", "%#{t}%"]) }

end
