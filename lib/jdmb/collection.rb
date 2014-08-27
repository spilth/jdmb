module JDMB
  class Collection
    def initialize(options)
      parse_progs(options[:progs])
    end

    def includes_prog?(prog_number)
      @progs.include?(prog_number)
    end

    private

    def parse_progs(prog_list)
      @progs = []

      prog_ranges = prog_list.split(',')

      prog_ranges.each do |prog_range|
        if prog_range.include?('-')
          (first, last) = prog_range.split('-').map { |d| Integer(d) }
          progs = first..last
          @progs << progs.to_a
        else
          @progs << prog_range.to_i
        end

        @progs.flatten!
      end

    end
  end
end

