    patch '/pizzas/:id' do
        @pizza = Pizza.find_by(id: params[:id])

        if @pizza && @pizza.user == current_user
            if @pizza.update(params[:pizza])
                redirect to "/pizzas/#{@pizza.id}"
            else
                erb :'/pizzas/edit'
            end
        else
            redirect to "/pizzas"
        end 
    end