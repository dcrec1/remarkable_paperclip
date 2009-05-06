module Remarkable
  module Paperclip
    module Matchers
      class HaveAttachedFileMatcher < Remarkable::ActiveRecord::Base
        arguments :attribute
        
        assertion :has_attached_file?
        
        def has_attached_file?
          @subject.respond_to? "before_#{@attribute}_post_process_callback_chain"
        end
      end

      def have_attached_file(attribute)
        HaveAttachedFileMatcher.new(attribute).spec(self)
      end

    end
  end
end