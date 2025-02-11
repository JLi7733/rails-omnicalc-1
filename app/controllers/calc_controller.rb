class CalcController < ApplicationController
  def home
    render({:template => "calc_layouts/square"})
  end

  def square
    render({:template => "calc_layouts/square"})
  end

  def square_results
    @num = params["number"].to_f

    @square = @num**2
    render({:template => "calc_layouts/square_results"})
  end

  def sqrt
    render({:template => "calc_layouts/sqrt"})
  end

  def sqrt_results
    @user_num = params["user_number"].to_f

    @sqrt = Math.sqrt(@user_num)
    render({:template => "calc_layouts/sqrt_results"})
  end

  def random
    render({:template => "calc_layouts/random"})
  end

  def random_results
    @min = params["user_min"].to_f

    @max = params["user_max"].to_f

    @rand = rand(@min..@max)

    render({:template => "calc_layouts/random_results"})
  end

  def payment
    render({:template => "calc_layouts/payment"})
  end

  def payment_results
    @APR = params["user_apr"].to_f
    r = @APR/1200

    @years = params["user_years"].to_i
    n = @years*12

    @principal = params["user_pv"].to_f

    numer = r*@principal

    denom = 1-((1+r) ** -n)

    @payment = numer/denom

    @payment = @payment.to_fs(:currency)
    @APR = @APR.to_fs(:percentage, {:precision => 4})
    render({:template => "calc_layouts/payment_result"})
  end
end
