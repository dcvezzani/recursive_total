class RecTotal
  def valid_num?(num)
    num.to_s.match(/^-{0,1}\d+$/) != nil
  end
  def valid_op?(op)
    op.to_s.match(/^[-\+]$/) != nil
  end

  def rec_total(arr)
    if(arr.length == 0)
      return 0
    else
      x = arr.shift

      if valid_num?(x)
        return rec_total(arr) + x.to_i
      else
        op = x.to_sym if valid_op?(x)

        x = arr.shift
        num = x.to_i if valid_num?(x)

        return rec_total(arr).send(op, num)
      end
    end
  end
end

