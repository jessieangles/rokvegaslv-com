class PromoterGenerator < Rails::Generator::Base

  def manifest
    record do |m|

      initializer = "config/initializers/promoter.rb"
      m.file initializer, initializer

    end
  end

end
