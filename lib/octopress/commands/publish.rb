module Octopress
  class Publish < Command
    def self.init_with_program(p)
      p.command(:publish) do |c|
        c.syntax 'publish <PATH> [options]'
        c.description 'Convert a draft to a normal published post.'
        c.option 'date', '--date DATE', 'String that is parseable by Time#parse. (default: Time.now.iso8601)'
        c.option 'force', '--force', 'Overwrite file if it already exists'

        c.action do |args, options|
          abort "You must specify a path." if args.empty?
          options['path'] = args.first
          Draft.new(options).publish
        end
      end
    end
  end
end

