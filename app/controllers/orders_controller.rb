class OrdersController < ApplicationController
  protect_from_forgery with: :exception
  
  def create
    @order = Order.new(order_params)
    
    respond_to do |format|
      if @order.save
        format.json { 
          render json: { 
            status: 'success', 
            message: 'Спасибо! Ваша заявка принята. Мы свяжемся с вами в ближайшее время.' 
          }
        }
        format.html { redirect_to root_path, notice: 'Заявка успешно отправлена!' }
      else
        format.json { 
          render json: { 
            status: 'error', 
            message: 'Произошла ошибка при отправке заявки. Проверьте правильность заполнения полей.',
            errors: @order.errors.full_messages
          }, status: :unprocessable_entity
        }
        format.html { 
          flash[:alert] = 'Ошибка при отправке заявки: ' + @order.errors.full_messages.join(', ')
          redirect_to root_path 
        }
      end
    end
  rescue StandardError => e
    Rails.logger.error "Order creation error: #{e.message}"
    Rails.logger.error e.backtrace.join("\n")
    
    respond_to do |format|
      format.json { 
        render json: { 
          status: 'error', 
          message: 'Произошла техническая ошибка. Попробуйте позже или свяжитесь с нами напрямую.' 
        }, status: :internal_server_error
      }
      format.html { 
        flash[:alert] = 'Произошла техническая ошибка. Попробуйте позже.'
        redirect_to root_path 
      }
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :phone, :project_type, :message)
  end
end
