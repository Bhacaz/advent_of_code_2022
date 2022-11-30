require_relative 'input_fetcher'

class BasePart
  def self.run
    new.run
  end

  def run
    raise NotImplementedError
  end

  def input
    @input ||=
      begin
          split_input = InputFetcher.fetch.split("\n")
         if respond_to?(:input_parser)
           input_parser(split_input)
         else
           split_input
       end
     end
  end
end
