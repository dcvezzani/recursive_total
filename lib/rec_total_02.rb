class RecTotal02
  def valid_num?(num)
    num.to_s.match(/^-{0,1}\d+$/) != nil
  end
  def valid_op?(op)
    op.to_s.match(/^[-\+]$/) != nil
  end

  def rec_total(arr, total=0, first_time=true)
    if(arr.length == 0)
      return total

    else
      x = arr.shift

      if valid_num?(x)
        rec_total(arr, (total + x.to_i), false) 

      elsif first_time && !valid_num?(x)
        raise "invalid format"

      else
        op = x.to_sym if valid_op?(x)

        x = arr.shift
        num = x.to_i if valid_num?(x)

        rec_total(arr, (total.send(op, num)), false) 
      end
    end
  end
end

