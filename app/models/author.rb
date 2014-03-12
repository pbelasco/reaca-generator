class Author
  include MongoMapper::Document

  key :name, String
  key :bio, String

end
