class Class
  
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    
    history = attr_name + "_history"
    class_eval %Q{
      #setter for attr_name, save the history
      def #{attr_name}=(new_val)
        if @#{history}.nil?
          @#{history} = [nil]
        end
        @#{history}.push(new_val)
        @#{attr_name} = new_val
      end
      
      #getter for attr_name_history, return the history array except for the last element
      def #{history}
        if !@#{history}.nil?
          @#{history}.first @#{history}.length - 1
        end
      end
    }
  end
  
end
