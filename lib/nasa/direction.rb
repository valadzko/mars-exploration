class Direction

  DIRECTION_CODES = {N: [0,1], E: [1,0], S: [0,-1], W: [-1, 0]}

  def self.code_when_turning_right(direction_code)
    x,y = DIRECTION_CODES[direction_code.to_sym]
    DIRECTION_CODES.key([y, -x]).to_s
  end

  def self.code_when_turning_left(direction_code)
    x,y = DIRECTION_CODES[direction_code.to_sym]
    DIRECTION_CODES.key([-y, x]).to_s
  end

  def self.coordinates_in_direction(x_base, y_base, direction_code)
    dx, dy = DIRECTION_CODES[direction_code.to_sym]
    [x_base + dx, y_base + dy]
  end
end
