import PoincareConjectureCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def poincareProjection : Projection PoincareEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem poincare_projection_idempotent (x : PoincareEndgameState) :
    poincareProjection.toFun (poincareProjection.toFun x) = poincareProjection.toFun x := by
  exact poincareProjection.idempotent x

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
