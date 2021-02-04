class Array
  def rotate_left(step=1)
    step.times do
      self.insert(-1, self.delete_at(0))        
    end
    
    return self
  end  
end
  

