module Arel
  module Nodes
    class InsertStatement < Arel::Nodes::Node
      attr_accessor :relation, :columns, :values, :select, :on_conflict

      def initialize
        super()
        @relation = nil
        @columns  = []
        @values   = nil
        @select   = nil
        @on_conflict = nil
      end

      def initialize_copy other
        super
        @columns = @columns.clone
        @values =  @values.clone if @values
        @select =  @select.clone if @select
      end

      def hash
        [@relation, @columns, @values, @select, @on_conflict].hash
      end

      def eql? other
        self.class == other.class &&
          self.relation == other.relation &&
          self.columns == other.columns &&
          self.select == other.select &&
          self.values == other.values &&
          self.on_conflict == other.on_conflict
      end
      alias :== :eql?
    end
  end
end
