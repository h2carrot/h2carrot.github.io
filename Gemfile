source "https://rubygems.org"

ruby '>= 4.0.1'

# Ruby 4.0.1 compatibility fixes
if RUBY_VERSION >= '3.0'
  # 1. Fix Liquid 4.0.3: tainted? and untaint were removed in Ruby 3.2
  # We patch Kernel to ensure it's available everywhere, and specifically String for Liquid.
  module Ruby40Compatibility
    def tainted?; false; end
    def untaint; self; end
  end
  Object.include(Ruby40Compatibility)
  String.include(Ruby40Compatibility)

  # 2. Fix pathutil 0.16.2: IO.read doesn't accept Hash as second argument (length) in Ruby 3.0+
  module PathutilKeywordsPatch
    def read(*args, **kwd)
      if args.first.is_a?(Hash) && kwd.empty?
        kwd = args.shift
      end
      IO.read(@path, *args, **kwd)
    end
  end

  begin
    require 'pathutil'
    Pathutil.prepend(PathutilKeywordsPatch)
  rescue LoadError
    # Define placeholder to prepend before actual load
    class Pathutil; end
    Pathutil.prepend(PathutilKeywordsPatch)
  end
end

gem "csv"
gem "webrick"
gem "bigdecimal"

gem "github-pages", group: :jekyll_plugins
