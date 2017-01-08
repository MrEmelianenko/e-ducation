class UserRelationDecorator < ApplicationDecorator
  def relation_readable
    I18n.t("relations.#{relation_type}")
  end

  def reversed_relation_readable
    I18n.t("reversed_relations.#{relation_type}")
  end
end
