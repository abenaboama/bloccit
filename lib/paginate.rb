module Paginate
  def self.included( klass )
    klass.extend ClassMethods
  end
  
  module ClassMethods
    def paginate( options = {} )
      per_page = options[:per_page].to_i
      
      page = if options[:page]
               options[:page].to_i
             else
               0
             end
             
      limit( per_page ).offset( page * per_page )
    end
    
    def total_pages
      ( all.count / 10.to_f ).ceil
    end 
  end
end


