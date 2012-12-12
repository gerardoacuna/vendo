
class Site::InfoController < SiteController

  def templates
  	@themes = Theme.all
  end
  
end
