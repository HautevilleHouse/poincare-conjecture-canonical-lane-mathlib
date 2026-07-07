import PoincareConjectureCanonicalLaneLean.PerelmanAnalyticEvidenceTerms

/-!
# Perelman Foundational Theorem Inhabitants

This module gives the term-level interface for the foundational analytic theorem
inhabitants. A complete Perelman analytic formalization supplies these records;
the records then construct the analytic certificates, route evidence, endpoint
statement, and constrained Poincare closure route.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure CurvatureFoundationalInhabitants where
  riemannTensorSymmetries : Prop
  bianchiIdentities : Prop
  ricciContractionLaw : Prop
  scalarTraceLaw : Prop
  curvatureEvolutionInputs : Prop
  riemannTensorSymmetriesTerm : riemannTensorSymmetries
  bianchiIdentitiesTerm : bianchiIdentities
  ricciContractionLawTerm : ricciContractionLaw
  scalarTraceLawTerm : scalarTraceLaw
  curvatureEvolutionInputsTerm : curvatureEvolutionInputs

structure RicciFlowWithSurgeryFoundationalInhabitants where
  hamiltonDeTurckGaugeChoice : Prop
  stronglyParabolicReduction : Prop
  deTurckVectorField : Prop
  pullbackRecoversRicciFlow : Prop
  uniquenessCompatibility : Prop
  cutoffParametersChosen : Prop
  standardCapInserted : Prop
  postSurgeryCurvatureControlled : Prop
  noncollapsingPreservedThroughSurgery : Prop
  surgeryInductionContinues : Prop
  hamiltonDeTurckGaugeChoiceTerm : hamiltonDeTurckGaugeChoice
  stronglyParabolicReductionTerm : stronglyParabolicReduction
  deTurckVectorFieldTerm : deTurckVectorField
  pullbackRecoversRicciFlowTerm : pullbackRecoversRicciFlow
  uniquenessCompatibilityTerm : uniquenessCompatibility
  cutoffParametersChosenTerm : cutoffParametersChosen
  standardCapInsertedTerm : standardCapInserted
  postSurgeryCurvatureControlledTerm : postSurgeryCurvatureControlled
  noncollapsingPreservedThroughSurgeryTerm : noncollapsingPreservedThroughSurgery
  surgeryInductionContinuesTerm : surgeryInductionContinues

structure ShortTimeFoundationalInhabitants where
  parabolicRegularity : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  continuationCriterion : Prop
  parabolicRegularityTerm : parabolicRegularity
  localExistenceIntervalTerm : localExistenceInterval
  uniquenessOnOverlapTerm : uniquenessOnOverlap
  continuationCriterionTerm : continuationCriterion

structure EntropyMonotonicityFoundationalInhabitants where
  conjugateHeatEquation : Prop
  wFunctionalDefined : Prop
  muFunctionalDefined : Prop
  entropyMonotonicityFormula : Prop
  reducedVolumeMonotonicity : Prop
  conjugateHeatEquationTerm : conjugateHeatEquation
  wFunctionalDefinedTerm : wFunctionalDefined
  muFunctionalDefinedTerm : muFunctionalDefined
  entropyMonotonicityFormulaTerm : entropyMonotonicityFormula
  reducedVolumeMonotonicityTerm : reducedVolumeMonotonicity

structure NoncollapsingFoundationalInhabitants where
  noLocalCollapsing : Prop
  scaleInvariantVolumeLowerBound : Prop
  curvatureScaleCompatibility : Prop
  ancientSolutionCompactnessInput : Prop
  noLocalCollapsingTerm : noLocalCollapsing
  scaleInvariantVolumeLowerBoundTerm : scaleInvariantVolumeLowerBound
  curvatureScaleCompatibilityTerm : curvatureScaleCompatibility
  ancientSolutionCompactnessInputTerm : ancientSolutionCompactnessInput

structure SingularityModelFoundationalInhabitants where
  blowupSequenceChosen : Prop
  pointedLimitExists : Prop
  ancientKappaSolution : Prop
  asymptoticShrinkersControlled : Prop
  blowupSequenceChosenTerm : blowupSequenceChosen
  pointedLimitExistsTerm : pointedLimitExists
  ancientKappaSolutionTerm : ancientKappaSolution
  asymptoticShrinkersControlledTerm : asymptoticShrinkersControlled

structure CanonicalNeighborhoodFoundationalInhabitants where
  highCurvaturePointClassified : Prop
  neckCapOrRoundComponent : Prop
  surgeryScaleAdmissible : Prop
  persistenceUnderFlow : Prop
  highCurvaturePointClassifiedTerm : highCurvaturePointClassified
  neckCapOrRoundComponentTerm : neckCapOrRoundComponent
  surgeryScaleAdmissibleTerm : surgeryScaleAdmissible
  persistenceUnderFlowTerm : persistenceUnderFlow

structure GeometrizationFoundationalInhabitants where
  thickThinDecomposition : Prop
  finiteExtinctionAlternative : Prop
  primeDecompositionControlled : Prop
  geometrizationPiecesClassified : Prop
  thickThinDecompositionTerm : thickThinDecomposition
  finiteExtinctionAlternativeTerm : finiteExtinctionAlternative
  primeDecompositionControlledTerm : primeDecompositionControlled
  geometrizationPiecesClassifiedTerm : geometrizationPiecesClassified

structure EndpointFoundationalInhabitants where
  sphericalSpaceFormExcluded : Prop
  simplyConnectedEndpoint : Prop
  sphereDiffeomorphismProduced : Prop
  sphericalSpaceFormExcludedTerm : sphericalSpaceFormExcluded
  simplyConnectedEndpointTerm : simplyConnectedEndpoint
  sphereDiffeomorphismProducedTerm : sphereDiffeomorphismProduced

structure PerelmanFoundationalTheoremInhabitants where
  curvature : CurvatureFoundationalInhabitants
  ricciFlowWithSurgery : RicciFlowWithSurgeryFoundationalInhabitants
  shortTime : ShortTimeFoundationalInhabitants
  entropy : EntropyMonotonicityFoundationalInhabitants
  noncollapsing : NoncollapsingFoundationalInhabitants
  singularity : SingularityModelFoundationalInhabitants
  canonicalNeighborhood : CanonicalNeighborhoodFoundationalInhabitants
  geometrization : GeometrizationFoundationalInhabitants
  endpoint : EndpointFoundationalInhabitants

def PerelmanFoundationalTheoremInhabitants.toAnalyticProofCertificate
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    PerelmanAnalyticProofCertificate A := {
  curvature := {
    riemannTensorSymmetries := T.curvature.riemannTensorSymmetries
    bianchiIdentities := T.curvature.bianchiIdentities
    ricciContractionLaw := T.curvature.ricciContractionLaw
    scalarTraceLaw := T.curvature.scalarTraceLaw
    curvatureEvolutionInputs := T.curvature.curvatureEvolutionInputs
    riemannTensorSymmetriesClosed := T.curvature.riemannTensorSymmetriesTerm
    bianchiIdentitiesClosed := T.curvature.bianchiIdentitiesTerm
    ricciContractionLawClosed := T.curvature.ricciContractionLawTerm
    scalarTraceLawClosed := T.curvature.scalarTraceLawTerm
    curvatureEvolutionInputsClosed := T.curvature.curvatureEvolutionInputsTerm
    curvatureEvidence := A.curvatureEvidence
  }
  flow := {
    gaugeChoice := T.ricciFlowWithSurgery.hamiltonDeTurckGaugeChoice
    stronglyParabolicReduction := T.ricciFlowWithSurgery.stronglyParabolicReduction
    deTurckVectorField := T.ricciFlowWithSurgery.deTurckVectorField
    pullbackRecoversRicciFlow := T.ricciFlowWithSurgery.pullbackRecoversRicciFlow
    uniquenessCompatibility := T.ricciFlowWithSurgery.uniquenessCompatibility
    gaugeChoiceClosed := T.ricciFlowWithSurgery.hamiltonDeTurckGaugeChoiceTerm
    stronglyParabolicReductionClosed := T.ricciFlowWithSurgery.stronglyParabolicReductionTerm
    deTurckVectorFieldClosed := T.ricciFlowWithSurgery.deTurckVectorFieldTerm
    pullbackRecoversRicciFlowClosed := T.ricciFlowWithSurgery.pullbackRecoversRicciFlowTerm
    uniquenessCompatibilityClosed := T.ricciFlowWithSurgery.uniquenessCompatibilityTerm
    flowEvidence := A.flowEvidence
  }
  shortTime := {
    parabolicRegularity := T.shortTime.parabolicRegularity
    localExistenceInterval := T.shortTime.localExistenceInterval
    uniquenessOnOverlap := T.shortTime.uniquenessOnOverlap
    continuationCriterion := T.shortTime.continuationCriterion
    parabolicRegularityClosed := T.shortTime.parabolicRegularityTerm
    localExistenceIntervalClosed := T.shortTime.localExistenceIntervalTerm
    uniquenessOnOverlapClosed := T.shortTime.uniquenessOnOverlapTerm
    continuationCriterionClosed := T.shortTime.continuationCriterionTerm
    shortTimeEvidence := A.shortTimeEvidence
  }
  entropy := {
    conjugateHeatEquation := T.entropy.conjugateHeatEquation
    wFunctionalDefined := T.entropy.wFunctionalDefined
    muFunctionalDefined := T.entropy.muFunctionalDefined
    entropyMonotonicityFormula := T.entropy.entropyMonotonicityFormula
    reducedVolumeMonotonicity := T.entropy.reducedVolumeMonotonicity
    conjugateHeatEquationClosed := T.entropy.conjugateHeatEquationTerm
    wFunctionalDefinedClosed := T.entropy.wFunctionalDefinedTerm
    muFunctionalDefinedClosed := T.entropy.muFunctionalDefinedTerm
    entropyMonotonicityFormulaClosed := T.entropy.entropyMonotonicityFormulaTerm
    reducedVolumeMonotonicityClosed := T.entropy.reducedVolumeMonotonicityTerm
    entropyEvidence := A.entropyEvidence
  }
  noncollapsing := {
    noLocalCollapsing := T.noncollapsing.noLocalCollapsing
    scaleInvariantVolumeLowerBound := T.noncollapsing.scaleInvariantVolumeLowerBound
    curvatureScaleCompatibility := T.noncollapsing.curvatureScaleCompatibility
    ancientSolutionCompactnessInput := T.noncollapsing.ancientSolutionCompactnessInput
    noLocalCollapsingClosed := T.noncollapsing.noLocalCollapsingTerm
    scaleInvariantVolumeLowerBoundClosed := T.noncollapsing.scaleInvariantVolumeLowerBoundTerm
    curvatureScaleCompatibilityClosed := T.noncollapsing.curvatureScaleCompatibilityTerm
    ancientSolutionCompactnessInputClosed := T.noncollapsing.ancientSolutionCompactnessInputTerm
    noncollapsingEvidence := A.noncollapsingEvidence
  }
  singularity := {
    blowupSequenceChosen := T.singularity.blowupSequenceChosen
    pointedLimitExists := T.singularity.pointedLimitExists
    ancientKappaSolution := T.singularity.ancientKappaSolution
    asymptoticShrinkersControlled := T.singularity.asymptoticShrinkersControlled
    blowupSequenceChosenClosed := T.singularity.blowupSequenceChosenTerm
    pointedLimitExistsClosed := T.singularity.pointedLimitExistsTerm
    ancientKappaSolutionClosed := T.singularity.ancientKappaSolutionTerm
    asymptoticShrinkersControlledClosed := T.singularity.asymptoticShrinkersControlledTerm
    singularityEvidence := A.singularityModelsEvidence
  }
  canonicalNeighborhood := {
    highCurvaturePointClassified := T.canonicalNeighborhood.highCurvaturePointClassified
    neckCapOrRoundComponent := T.canonicalNeighborhood.neckCapOrRoundComponent
    surgeryScaleAdmissible := T.canonicalNeighborhood.surgeryScaleAdmissible
    persistenceUnderFlow := T.canonicalNeighborhood.persistenceUnderFlow
    highCurvaturePointClassifiedClosed := T.canonicalNeighborhood.highCurvaturePointClassifiedTerm
    neckCapOrRoundComponentClosed := T.canonicalNeighborhood.neckCapOrRoundComponentTerm
    surgeryScaleAdmissibleClosed := T.canonicalNeighborhood.surgeryScaleAdmissibleTerm
    persistenceUnderFlowClosed := T.canonicalNeighborhood.persistenceUnderFlowTerm
    neighborhoodEvidence := A.canonicalNeighborhoodsEvidence
  }
  surgery := {
    cutoffParametersChosen := T.ricciFlowWithSurgery.cutoffParametersChosen
    standardCapInserted := T.ricciFlowWithSurgery.standardCapInserted
    postSurgeryCurvatureControlled := T.ricciFlowWithSurgery.postSurgeryCurvatureControlled
    noncollapsingPreserved := T.ricciFlowWithSurgery.noncollapsingPreservedThroughSurgery
    surgeryInductionContinues := T.ricciFlowWithSurgery.surgeryInductionContinues
    cutoffParametersChosenClosed := T.ricciFlowWithSurgery.cutoffParametersChosenTerm
    standardCapInsertedClosed := T.ricciFlowWithSurgery.standardCapInsertedTerm
    postSurgeryCurvatureControlledClosed := T.ricciFlowWithSurgery.postSurgeryCurvatureControlledTerm
    noncollapsingPreservedClosed := T.ricciFlowWithSurgery.noncollapsingPreservedThroughSurgeryTerm
    surgeryInductionContinuesClosed := T.ricciFlowWithSurgery.surgeryInductionContinuesTerm
    surgeryEvidence := A.surgeryEvidence
  }
  geometrization := {
    thickThinDecomposition := T.geometrization.thickThinDecomposition
    finiteExtinctionAlternative := T.geometrization.finiteExtinctionAlternative
    primeDecompositionControlled := T.geometrization.primeDecompositionControlled
    geometrizationPiecesClassified := T.geometrization.geometrizationPiecesClassified
    thickThinDecompositionClosed := T.geometrization.thickThinDecompositionTerm
    finiteExtinctionAlternativeClosed := T.geometrization.finiteExtinctionAlternativeTerm
    primeDecompositionControlledClosed := T.geometrization.primeDecompositionControlledTerm
    geometrizationPiecesClassifiedClosed := T.geometrization.geometrizationPiecesClassifiedTerm
    geometrizationEvidence := A.geometrizationEvidence
  }
  endpoint := {
    sphericalSpaceFormExcluded := T.endpoint.sphericalSpaceFormExcluded
    simplyConnectedEndpoint := T.endpoint.simplyConnectedEndpoint
    sphereDiffeomorphismProduced := T.endpoint.sphereDiffeomorphismProduced
    sphericalSpaceFormExcludedClosed := T.endpoint.sphericalSpaceFormExcludedTerm
    simplyConnectedEndpointClosed := T.endpoint.simplyConnectedEndpointTerm
    sphereDiffeomorphismProducedClosed := T.endpoint.sphereDiffeomorphismProducedTerm
    endpointEvidence := A.endpointEvidence
  }
}

def PerelmanFoundationalTheoremInhabitants.evidenceTerms
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    PerelmanAnalyticEvidenceTerms (T.toAnalyticProofCertificate A) :=
  (T.toAnalyticProofCertificate A).evidenceTerms

theorem foundational_ricci_flow_with_surgery_inhabitant
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    RicciFlowPDEClosed A.flow ∧ SurgeryClosed A.surgery := by
  exact (T.toAnalyticProofCertificate A).evidenceTerms.routeClosed.left

theorem foundational_entropy_monotonicity_inhabitant
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    PerelmanEntropyClosed A.entropy := by
  exact (T.toAnalyticProofCertificate A).evidenceTerms.routeClosed.right.left

theorem foundational_noncollapsing_inhabitant
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    NoncollapsingClosed A.noncollapsing := by
  exact (T.toAnalyticProofCertificate A).evidenceTerms.routeClosed.right.right.left

theorem foundational_canonical_neighborhood_inhabitant
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    CanonicalNeighborhoodsClosed A.canonicalNeighborhoods := by
  exact (T.toAnalyticProofCertificate A).evidenceTerms.routeClosed.right.right.right.left

theorem foundational_surgery_control_inhabitant
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    SurgeryClosed A.surgery := by
  exact (T.toAnalyticProofCertificate A).evidenceTerms.routeClosed.right.right.right.right.left

theorem foundational_finite_extinction_geometrization_inhabitant
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    GeometrizationClosed A.geometrization := by
  exact (T.toAnalyticProofCertificate A).evidenceTerms.routeClosed.right.right.right.right.right.left

theorem foundational_endpoint_classification_inhabitant
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    EndpointClassificationClosed A.endpoint := by
  exact (T.toAnalyticProofCertificate A).evidenceTerms.routeClosed.right.right.right.right.right.right

theorem foundational_theorem_inhabitants_close_perelman_route
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    PerelmanRouteClosed A.toPerelmanRouteObligations := by
  exact (T.toAnalyticProofCertificate A).evidenceTerms.routeClosed

theorem foundational_theorem_inhabitants_supply_mathlib_endpoint
    (A : RicciFlowAnalyticFoundation) (T : PerelmanFoundationalTheoremInhabitants) :
    @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere
      A.endpoint.targetManifold A.endpoint.targetTopology 3 := by
  exact (T.toAnalyticProofCertificate A).evidenceTerms.mathlibSphereEndpoint

theorem foundational_theorem_inhabitants_yield_constrained_closure
    (A : AdmissibleClass) {R : RicciFlowAnalyticFoundation}
    (T : PerelmanFoundationalTheoremInhabitants)
    (bridgeFromFoundationalTerms : bridgeClosed A)
    (gateFromFoundationalTerms : gateClosed A) :
    ConstrainedPoincareClosure A := by
  exact perelman_analytic_evidence_terms_yield_constrained_closure
    A (T.toAnalyticProofCertificate R) bridgeFromFoundationalTerms gateFromFoundationalTerms

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
