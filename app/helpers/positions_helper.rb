module PositionsHelper
  # TODO: Replace this with I18n.
  def translate_context(context)
    return 'Institucional' if context == 'institutional'
    'Projeto'
  end
end
