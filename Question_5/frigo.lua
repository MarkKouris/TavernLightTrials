
--functions were for testing purposes
function Transpose(m)
	local rotated = {}
	for c, m_1_c in ipairs(m[1]) do
	   local col = {m_1_c}
	   for r = 2, #m do
		  col[r] = m[r][c]
	   end
	   table.insert(rotated, col)
	end
	return rotated
end

function Rotate_CCW_90(m)
	local rotated = {}
	for c, m_1_c in ipairs(m[1]) do
	   local col = {m_1_c}
	   for r = 2, #m do
		  col[r] = m[r][c]
	   end
	   table.insert(rotated, 1, col)
	end
	return rotated
end
 
function Rotate_180(m)
	return Rotate_CCW_90(Rotate_CCW_90(m))
end

arr2 = { --for showing the result when you stay in place
	{0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 0, 1, 0, 0, 0},
	{0, 0, 1, 0, 1, 0, 1, 0, 0},
	{0, 1, 0, 1, 2, 1, 0, 1, 0},
	{0, 0, 1, 0, 1, 0, 1, 0, 0},
	{0, 0, 0, 1, 0, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0}

}

arr1 = { --for showing the result when you move
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0},
	{0, 1, 0, 1, 1, 2, 0, 1, 0, 1, 0},
	{0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setArea(createCombatArea(arr2))


--the follow just scales the damage
function onGetFormulaValues(player, level, magicLevel)
	local min = (level / 5) + (magicLevel * 5.5) + 25
	local max = (level / 5) + (magicLevel * 11) + 50
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

--this just targets a creatue, useless
function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
