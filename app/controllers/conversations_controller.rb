class ConversationsController < ApplicationController
  def index
    render locals: { conversations: conversations.decorate }
  end

  def show
    render locals: { conversation: conversation.decorate }
  end

  def create
    conversation = Conversation.by_users([current_user, user])

    if conversation
      redirect_to conversation_path(conversation)
    else
      redirect_to conversations_path
    end
  end

  private

  def conversation
    return @_conversation if defined?(@_conversation)
    @_conversation = Conversation.find(params[:id])
  end

  def conversations
    return @_conversations if defined?(@_conversations)
    @_conversations = Conversation.for_user(current_user)
  end

  def user
    return @_user if defined?(@_user)
    @_user = User.find(params[:user_id])
  end

  def conversation_params
  end
end
