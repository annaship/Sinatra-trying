Dir["#{File.dirname(__FILE__)}/services/**/*.rb"].each { |service| load service }

get '/foo.xml' do
  content_type 'text/xml', :charset => 'utf-8'
  "<root><h1>Hello World</h1></root>"
end

require 'rubygems'
require 'libxml'

include LibXML

class PostCallbacks
  include XML::SaxParser::Callbacks

  def on_start_element(element, attributes)
    if element == 'row'
      # Process row of data here
    end
  end
end

parser = XML::SaxParser.file("posts.xml")
parser.callbacks = PostCallbacks.new
parser.parse

@tf_arr = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><names xmlns:dwc=\"http://rs.tdwg.org/dwc/terms/\"><name><verbatim>Abra</verbatim><dwc:scientificName>Abra</dwc:scientificName><offsets><offset start=\"0\" end=\"3\"/></offsets></name><name><verbatim>Abra abra</verbatim><dwc:scientificName>Abra abra</dwc:scientificName><offsets><offset start=\"4\" end=\"12\"/></offsets></name><name><verbatim>Abra aequalis</verbatim><dwc:scientificName>Abra aequalis</dwc:scientificName><offsets><offset start=\"13\" end=\"25\"/></offsets></name><name><verbatim>Abra affinis</verbatim><dwc:scientificName>Abra affinis</dwc:scientificName><offsets><offset start=\"26\" end=\"37\"/></offsets></name><name><verbatim>Atys sandersoni</verbatim><dwc:scientificName>Atys sandersoni</dwc:scientificName><offsets><offset start=\"38\" end=\"52\"/></offsets></name></names></response>"
=> "<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><names xmlns:dwc=\"http://rs.tdwg.org/dwc/terms/\"><name><verbatim>Abra</verbatim><dwc:scientificName>Abra</dwc:scientificName><offsets><offset start=\"0\" end=\"3\"/></offsets></name><name><verbatim>Abra abra</verbatim><dwc:scientificName>Abra abra</dwc:scientificName><offsets><offset start=\"4\" end=\"12\"/></offsets></name><name><verbatim>Abra aequalis</verbatim><dwc:scientificName>Abra aequalis</dwc:scientificName><offsets><offset start=\"13\" end=\"25\"/></offsets></name><name><verbatim>Abra affinis</verbatim><dwc:scientificName>Abra affinis</dwc:scientificName><offsets><offset start=\"26\" end=\"37\"/></offsets></name><name><verbatim>Atys sandersoni</verbatim><dwc:scientificName>Atys sandersoni</dwc:scientificName><offsets><offset start=\"38\" end=\"52\"/></offsets></name></names></response>"
irb(main):025:0> XML::Parser.string(@tf_arr).parse
