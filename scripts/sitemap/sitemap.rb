require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://www.iwakfu.com'
SitemapGenerator::Sitemap.create do
  add '/items', :changefreq => 'weekly', :priority => 0.9
  add '/item_builds', :changefreq => 'weekly', :priority => 0.9
  add '/item_sets', :changefreq => 'weekly', :priority => 0.9
  add '/mobs', :changefreq => 'weekly', :priority => 0.9
  add '/recipes', :changefreq => 'weekly', :priority => 0.9
end
SitemapGenerator::Sitemap.ping_search_engines # Not needed if you use the rake tasks