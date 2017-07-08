# frozen_string_literal: true

module RickRss
  class Cli
    attr_reader :command

    def initialize(command)
      @command = command.first&.tr("-", "") || 'help'
    end

    def run
      if respond_to? command.to_sym
        send(command.to_sym)
      else
        help
      end
    end

    def install
      RickRss::Install.run
    end

    def version
      puts RickRss::VERSION
    end

    alias v version

    def start
      puts "Starting ..."
      RickRss::Init.call
      RickRss::Poll.start
    end

    def help
      puts <<-EOM.strip_heredoc
        Usage: rick [command]
               install      Install to ~/.rick_rss
               start        Start polling for feeds' updates
           -v, version      Print version
           -h, help         Print usage
      EOM
    end

    alias h help
  end
end
