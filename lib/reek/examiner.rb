require 'reek/sniffer'

module Reek

  #
  # Finds the code smells in Ruby source code
  #
  class Examiner
    attr_accessor :sniffer

    def initialize(source)
      @sniffer = source.sniff
    end

    def all_smells
      cwarnings = MaskingCollection.new
      @sniffer.report_on(cwarnings)
      cwarnings.all_items
    end

    def description
      @sniffer.desc
    end

    def smelly?
      @sniffer.smelly?
    end
  end
end