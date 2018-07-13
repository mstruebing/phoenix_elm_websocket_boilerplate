defmodule PhoenixElmWebsocketBoilerplateWeb.RoomChannel do
  use PhoenixElmWebsocketBoilerplateWeb, :channel

  require Logger

  def join("room", _, socket), do: {:ok, socket}

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("room:ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  def handle_in("room:user:login", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
