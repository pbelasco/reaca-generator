#scraping comentarios veja

require "open-uri"

@url = ARGV[0] 
@tags = ARGV[1]

puts @url
puts @tags

# @url = "http://comentarios1.folha.com.br/comentarios/5936024"
@response = ''

# open-uri RDoc: http://stdlib.rubyonrails.org/libdoc/open-uri/rdoc/index.html
f = open(@url)
@response = f.read
puts @response

doc = Hpricot(@response)

(doc/"//article/div[3]/p[1]").each do |comment|

	s = Sample.new(:author => "Leitor da Folha de São Paulo", :tags => @tags, :body => comment.inner_html, :url => @url)
	s.save
    puts "#{comment.inner_html}"

end