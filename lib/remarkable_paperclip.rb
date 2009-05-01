require 'remarkable'
require 'remarkable/messages'
require 'remarkable/dsl/assertions'
require 'remarkable/matchers'
require 'remarkable/macros'
require 'remarkable/base'

module Remarkable
  module Paperclip
    class Base < Remarkable::Base
    end
    module Matchers
      class HaveAttachedFileMatcher < Remarkable::Paperclip::Base
        def initialize(attribute)
          @attribute = attribute.to_s
        end
        
        def matches(model)
          model.respond_to? "before_#{@attribute}_post_process_callback_chain"
        end
      end

      def have_attached_file(attribute)
        HaveAttachedFileMatcher.new(attribute).spec(self)
      end

    end
  end
end

Remarkable.include_matchers!(Remarkable::Paperclip, Spec::Example::ExampleGroup)