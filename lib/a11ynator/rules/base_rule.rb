module A11ynator
  module Rules
    class BaseRule
      def check(_content, _file)
        raise NotImplementedError, 'Each rule must implement the `check` method'
      end

      def name
        self.class.name.split('::').last
      end

      def severity
        :warning
      end
    end
  end
end
