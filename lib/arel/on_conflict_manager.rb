module Arel
  class OnConflictManager < Arel::TreeManager
    def initialize
      super
      @ast = Nodes::OnConflict.new
      @ctx = @ast
    end

    def do_nothing
      @ast.action = Nodes::DoNothing.new
      self
    end

    def update

    end

    def wheres= exprs
      @ast.wheres = exprs
    end

    def where expr
      @ast.wheres << expr
      self
    end

    def set values
      if String === values
        @ast.values = [values]
      else
        @ast.values = values.map { |column,value|
          Nodes::Assignment.new(
            Nodes::UnqualifiedColumn.new(column),
            value
          )
        }
      end
      self
    end
  end
end
