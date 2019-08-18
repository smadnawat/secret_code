module SecretCodesHelper
	def code_to_select
		SecretCode.fresh.pluck(:code)
	end
end
