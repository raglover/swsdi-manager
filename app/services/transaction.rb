class Transaction
	
	def initialize order, nonce
		@order = order
		@nonce = nonce
	end

	def execute
		@result = Braintree::Transaction.sale(
			:amount => order[:amount],
			:payment_method_nonce => nonce,
			:options => {
				:submit_for_settlement => true
			}
		)
	end

	def ok?
		@result.success?
	end

	private

		attr_reader :order, :nonce
end
