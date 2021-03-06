module VariablesSpecs
  class ParAsgn
    attr_accessor :x

    def initialize
      @x = 0
    end

    def inc
      @x += 1
    end

    def to_ary
      [1,2,3,4]
    end
  end

  class OpAsgn
    attr_accessor :a, :b, :side_effect

    def do_side_effect
      self.side_effect = true
      return @a
    end

    def do_more_side_effects
      @a += 5
      self
    end

    def do_bool_side_effects
      @b += 1
      self
    end
  end

  class Hashalike
    def [](k) k end
    def []=(k, v) [k, v] end
  end

  def self.reverse_foo(a, b)
    return b, a
  end

  class ArrayLike
    def initialize(array)
      @array = array
    end

    def to_a
      @array
    end
  end

  # The only reason to use this rather than an explict mock is that this way
  # the order of the method calls can be guaranteed.
  class ArgsRecorder
    attr_reader :record
    # basic, dumb, constant return values so that
    # there's no hiding nil or error
    attr_accessor :getter_return, :setter_return

    def initialize
      @getter_return, @setter_return = 1, 2
      @record = []
    end

    def [] *args
      @record.push [:[], args]
      @getter_return
    end

    def []= *args
      @record.push [:[]=, args]
      @setter_return
    end
  end

  class ArraySubclass < Array
  end
end
