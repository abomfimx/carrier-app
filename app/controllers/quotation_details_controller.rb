class QuotationDetailsController < ApplicationController
  def new

    @quotation = Quotation.find(params[:quotation_id])
    @quotation_detail = QuotationDetail.new()
    @carriers =  Carrier.all

  end

  def list
    @quotation = Quotation.find(params[:quotation_id])
    @quotation_details = QuotationDetail.where(quotation_id: params[:quotation_id])

    sql = "select c.id, c.brand_name, cp.price, d.days
    from carrier_prices cp, delivery_periods d, carriers c
    where 
    ? between cp.min_volume/1000.0 and cp.max_volume/1000.0 and
    ? between cp.min_weight and cp.max_weight and
    ? between d.min_distance and d.max_distance and
    cp.carrier_id = c.id and
    d.carrier_id = c.id and
    c.active_state = true"

    vol = @quotation.height * @quotation.width * @quotation.depth/1_000_000.0
    kg = (@quotation.weight/1_000.0).round
    km = @quotation.distance

    @results = QuotationDetail.execute_sql(sql, vol, kg, km) 

    @count_detail = QuotationDetail.where(quotation_id: params[:quotation_id]).count

    if @count_detail == 0
      @results.each do |result| 
          @v_price = result['price'].to_i * @quotation.distance / 100.0
          if (result['price'].to_i * @quotation.distance / 100.0) < 30.0
            @v_price = 30.0
          else 
            @v_price
          end
          @qd = QuotationDetail.new(delivery_date: Date.today + result['days'], shipping_price: @v_price, carrier_id: result['id'], quotation_id: params[:quotation_id])
          unless @qd.save 
            flash.now[:notice] = 'Erro ao salvar quotação'
            redirect_to root_path
          end
      end
    end
  end

  def create 

  end

  def show
    @quotation = Quotation.find(params[:quotation_id])
    @quotation_detail = QuotationDetail.all
  end

end