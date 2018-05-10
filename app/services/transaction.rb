class Transaction
	
	def initialize order, nonce
		@order = order
		@nonce = nonce
	end

	def execute
		@result = Braintree::Transaction.sale(
			:amount => order[:amount],
			:payment_method_nonce => nonce,
            :credit_card => {
                :cardholder_name => "#{order[:first_name]} #{order[:last_name]}"
            },
			:options => {
				:submit_for_settlement => true
			}
		)
	end

	def ok?
		@result.success?
	end

    def errors
        @result.transaction.status
    end

    def order_id
        @result.transaction.id
    end

    def created
        @result.transaction.created_at
    end

	private

		attr_reader :order, :nonce
end
