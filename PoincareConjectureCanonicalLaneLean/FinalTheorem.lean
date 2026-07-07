import PoincareConjectureCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

def ConstrainedPoincareClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_poincare_endgame (A : AdmissibleClass) :
    ConstrainedPoincareClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
