class Sample
	include MongoMapper::Document

	key :body, String
	key :tags, Array
	key :author, String
	key :url, String


	def self.find_all_by_tag(tag)
		Sample.where("#{tag}" => {'$exists' => true}).all
	end

end
