import PoincareConjectureCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PoincareWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
