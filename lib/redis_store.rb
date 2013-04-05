class ActiveSupport::Cache::RedisStore
  # 存入整个hash
  def hwrite(key, hash)
    @data.hmset(key, *hash.map{|k, v| [k, Marshal.dump(v)]}.flatten(1))
  end
  
  # 取整个hash或hash中某个key的值
  def hread(key, field = nil)
    field.nil? ? Hash[*@data.hgetall(key).map{|k, v| [k, Marshal.load(v)]}.flatten(1)] :
                 Marshal.load(@data.hget(key, field))
  rescue TypeError
    return nil
  end

  # 转发其它所有方法
  def method_missing(method, *args, &block)
    @data.send(method, *args, &block)
  end
end
