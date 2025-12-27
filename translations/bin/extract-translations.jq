def extract($path):
  if type == "array" then
    . as $arr
    |
    reduce range(0; ($arr | length)) as $i
      ({};
       . * ($arr[$i] | extract($path + [$i]))
      )

  elif type == "object" then
    . as $obj
    |
    (
      if ($obj | has("translate") or has("fallback")) then
        if ($obj | has("translate") and has("fallback")) then
          { ($obj.translate): $obj.fallback }
        else
          error(
            "Invalid translate/fallback pair at path: "
            + ($path | map(tostring) | join("."))
          )
        end
      else
        {}
      end
    )
    *
    (
      reduce ($obj | keys[]) as $k
        ({};
         . * ($obj[$k] | extract($path + [$k]))
        )
    )

  else
    {}
  end;

extract([])
