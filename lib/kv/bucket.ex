defmodule KV.Bucket do
  @doc """
  Starts a new bucket
  """

  def start_link do
    Agent.start_link(fn -> HashDict.new end)
  end

  @doc """
  Gets a value from the bucket by key
  """

  def get(bucket, key) do
    Agent.get(bucket, &HashDict.get(&1, key))
  end

  @doc """
  Puts the value from the digen key in a bucket
  """
 
  def put(bucket, key, value) do
    Agent.update(bucket, &HashDict.put(&1, key, value))
  end

  @doc """
  deletes key from bucket

  Returns the current value of key if it exists
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn dict->
      HashDict.pop(dict, key) 
    end)
  end
end

