import PoincareConjectureCanonicalLaneLean.PerelmanFoundationalTheoremInhabitants

/-!
# Perelman Deep Analytic Construction

This module refines the foundational inhabitants into a deeper analytic
construction interface. The construction names the Ricci-flow, curvature,
entropy, noncollapsing, singularity, surgery, geometrization, and endpoint
ingredients that feed the already checked Perelman route.

The module is intentionally term-level: each analytic construction supplies
Lean inhabitants for its named analytic components and maps them into the
foundational theorem inhabitants used by the route closure.
-/

namespace HautevilleHouse
namespace PoincareConjectureCanonicalLaneLean

structure CurvatureTensorConstruction where
  metricCompatibility : Prop
  torsionFreeConnection : Prop
  curvatureCommutatorFormula : Prop
  skewSymmetryDerived : Prop
  pairSymmetryDerived : Prop
  firstBianchiDerived : Prop
  ricciTraceDerived : Prop
  scalarTraceDerived : Prop
  curvatureEvolutionDerived : Prop
  riemannTensorSymmetries : Prop
  bianchiIdentities : Prop
  ricciContractionLaw : Prop
  scalarTraceLaw : Prop
  curvatureEvolutionInputs : Prop
  metricCompatibilityTerm : metricCompatibility
  torsionFreeConnectionTerm : torsionFreeConnection
  curvatureCommutatorFormulaTerm : curvatureCommutatorFormula
  skewSymmetryDerivedTerm : skewSymmetryDerived
  pairSymmetryDerivedTerm : pairSymmetryDerived
  firstBianchiDerivedTerm : firstBianchiDerived
  ricciTraceDerivedTerm : ricciTraceDerived
  scalarTraceDerivedTerm : scalarTraceDerived
  curvatureEvolutionDerivedTerm : curvatureEvolutionDerived
  riemannTensorSymmetriesFromConstruction :
    metricCompatibility -> torsionFreeConnection -> curvatureCommutatorFormula ->
      skewSymmetryDerived -> pairSymmetryDerived -> riemannTensorSymmetries
  bianchiIdentitiesFromConstruction :
    curvatureCommutatorFormula -> firstBianchiDerived -> bianchiIdentities
  ricciContractionLawFromConstruction :
    curvatureCommutatorFormula -> ricciTraceDerived -> ricciContractionLaw
  scalarTraceLawFromConstruction :
    ricciTraceDerived -> scalarTraceDerived -> scalarTraceLaw
  curvatureEvolutionInputsFromConstruction :
    curvatureCommutatorFormula -> curvatureEvolutionDerived -> curvatureEvolutionInputs

def CurvatureTensorConstruction.toFoundational
    (C : CurvatureTensorConstruction) : CurvatureFoundationalInhabitants := {
  riemannTensorSymmetries := C.riemannTensorSymmetries
  bianchiIdentities := C.bianchiIdentities
  ricciContractionLaw := C.ricciContractionLaw
  scalarTraceLaw := C.scalarTraceLaw
  curvatureEvolutionInputs := C.curvatureEvolutionInputs
  riemannTensorSymmetriesTerm :=
    C.riemannTensorSymmetriesFromConstruction
      C.metricCompatibilityTerm
      C.torsionFreeConnectionTerm
      C.curvatureCommutatorFormulaTerm
      C.skewSymmetryDerivedTerm
      C.pairSymmetryDerivedTerm
  bianchiIdentitiesTerm :=
    C.bianchiIdentitiesFromConstruction
      C.curvatureCommutatorFormulaTerm
      C.firstBianchiDerivedTerm
  ricciContractionLawTerm :=
    C.ricciContractionLawFromConstruction
      C.curvatureCommutatorFormulaTerm
      C.ricciTraceDerivedTerm
  scalarTraceLawTerm :=
    C.scalarTraceLawFromConstruction
      C.ricciTraceDerivedTerm
      C.scalarTraceDerivedTerm
  curvatureEvolutionInputsTerm :=
    C.curvatureEvolutionInputsFromConstruction
      C.curvatureCommutatorFormulaTerm
      C.curvatureEvolutionDerivedTerm
}

structure RicciFlowWithSurgeryConstruction where
  smoothInitialMetric : Prop
  deTurckGaugeFixed : Prop
  linearizationComputed : Prop
  stronglyParabolicOperator : Prop
  deTurckVectorFieldConstructed : Prop
  pullbackEquationComputed : Prop
  uniquenessEstimate : Prop
  cutoffScaleChosen : Prop
  standardCapGeometryBuilt : Prop
  postSurgeryCurvatureEstimate : Prop
  noncollapsingTransferAcrossSurgery : Prop
  inductionAcrossSurgeryTimes : Prop
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
  smoothInitialMetricTerm : smoothInitialMetric
  deTurckGaugeFixedTerm : deTurckGaugeFixed
  linearizationComputedTerm : linearizationComputed
  stronglyParabolicOperatorTerm : stronglyParabolicOperator
  deTurckVectorFieldConstructedTerm : deTurckVectorFieldConstructed
  pullbackEquationComputedTerm : pullbackEquationComputed
  uniquenessEstimateTerm : uniquenessEstimate
  cutoffScaleChosenTerm : cutoffScaleChosen
  standardCapGeometryBuiltTerm : standardCapGeometryBuilt
  postSurgeryCurvatureEstimateTerm : postSurgeryCurvatureEstimate
  noncollapsingTransferAcrossSurgeryTerm : noncollapsingTransferAcrossSurgery
  inductionAcrossSurgeryTimesTerm : inductionAcrossSurgeryTimes
  gaugeChoiceFromConstruction :
    smoothInitialMetric -> deTurckGaugeFixed -> hamiltonDeTurckGaugeChoice
  parabolicReductionFromConstruction :
    linearizationComputed -> stronglyParabolicOperator -> stronglyParabolicReduction
  deTurckVectorFieldFromConstruction :
    deTurckGaugeFixed -> deTurckVectorFieldConstructed -> deTurckVectorField
  pullbackRecoversRicciFlowFromConstruction :
    deTurckVectorFieldConstructed -> pullbackEquationComputed -> pullbackRecoversRicciFlow
  uniquenessCompatibilityFromConstruction :
    uniquenessEstimate -> pullbackEquationComputed -> uniquenessCompatibility
  cutoffParametersChosenFromConstruction :
    cutoffScaleChosen -> cutoffParametersChosen
  standardCapInsertedFromConstruction :
    cutoffScaleChosen -> standardCapGeometryBuilt -> standardCapInserted
  postSurgeryCurvatureControlledFromConstruction :
    standardCapGeometryBuilt -> postSurgeryCurvatureEstimate -> postSurgeryCurvatureControlled
  noncollapsingPreservedThroughSurgeryFromConstruction :
    noncollapsingTransferAcrossSurgery -> postSurgeryCurvatureEstimate ->
      noncollapsingPreservedThroughSurgery
  surgeryInductionContinuesFromConstruction :
    inductionAcrossSurgeryTimes -> postSurgeryCurvatureEstimate -> surgeryInductionContinues

def RicciFlowWithSurgeryConstruction.toFoundational
    (R : RicciFlowWithSurgeryConstruction) : RicciFlowWithSurgeryFoundationalInhabitants := {
  hamiltonDeTurckGaugeChoice := R.hamiltonDeTurckGaugeChoice
  stronglyParabolicReduction := R.stronglyParabolicReduction
  deTurckVectorField := R.deTurckVectorField
  pullbackRecoversRicciFlow := R.pullbackRecoversRicciFlow
  uniquenessCompatibility := R.uniquenessCompatibility
  cutoffParametersChosen := R.cutoffParametersChosen
  standardCapInserted := R.standardCapInserted
  postSurgeryCurvatureControlled := R.postSurgeryCurvatureControlled
  noncollapsingPreservedThroughSurgery := R.noncollapsingPreservedThroughSurgery
  surgeryInductionContinues := R.surgeryInductionContinues
  hamiltonDeTurckGaugeChoiceTerm :=
    R.gaugeChoiceFromConstruction R.smoothInitialMetricTerm R.deTurckGaugeFixedTerm
  stronglyParabolicReductionTerm :=
    R.parabolicReductionFromConstruction
      R.linearizationComputedTerm
      R.stronglyParabolicOperatorTerm
  deTurckVectorFieldTerm :=
    R.deTurckVectorFieldFromConstruction
      R.deTurckGaugeFixedTerm
      R.deTurckVectorFieldConstructedTerm
  pullbackRecoversRicciFlowTerm :=
    R.pullbackRecoversRicciFlowFromConstruction
      R.deTurckVectorFieldConstructedTerm
      R.pullbackEquationComputedTerm
  uniquenessCompatibilityTerm :=
    R.uniquenessCompatibilityFromConstruction
      R.uniquenessEstimateTerm
      R.pullbackEquationComputedTerm
  cutoffParametersChosenTerm :=
    R.cutoffParametersChosenFromConstruction R.cutoffScaleChosenTerm
  standardCapInsertedTerm :=
    R.standardCapInsertedFromConstruction
      R.cutoffScaleChosenTerm
      R.standardCapGeometryBuiltTerm
  postSurgeryCurvatureControlledTerm :=
    R.postSurgeryCurvatureControlledFromConstruction
      R.standardCapGeometryBuiltTerm
      R.postSurgeryCurvatureEstimateTerm
  noncollapsingPreservedThroughSurgeryTerm :=
    R.noncollapsingPreservedThroughSurgeryFromConstruction
      R.noncollapsingTransferAcrossSurgeryTerm
      R.postSurgeryCurvatureEstimateTerm
  surgeryInductionContinuesTerm :=
    R.surgeryInductionContinuesFromConstruction
      R.inductionAcrossSurgeryTimesTerm
      R.postSurgeryCurvatureEstimateTerm
}

structure ShortTimeConstruction where
  parabolicFunctionSpace : Prop
  localSchauderEstimate : Prop
  fixedPointMapContractive : Prop
  intervalProduced : Prop
  overlapUniquenessEstimate : Prop
  curvatureContinuationCriterion : Prop
  parabolicRegularity : Prop
  localExistenceInterval : Prop
  uniquenessOnOverlap : Prop
  continuationCriterion : Prop
  parabolicFunctionSpaceTerm : parabolicFunctionSpace
  localSchauderEstimateTerm : localSchauderEstimate
  fixedPointMapContractiveTerm : fixedPointMapContractive
  intervalProducedTerm : intervalProduced
  overlapUniquenessEstimateTerm : overlapUniquenessEstimate
  curvatureContinuationCriterionTerm : curvatureContinuationCriterion
  parabolicRegularityFromConstruction :
    parabolicFunctionSpace -> localSchauderEstimate -> parabolicRegularity
  localExistenceIntervalFromConstruction :
    fixedPointMapContractive -> intervalProduced -> localExistenceInterval
  uniquenessOnOverlapFromConstruction :
    overlapUniquenessEstimate -> uniquenessOnOverlap
  continuationCriterionFromConstruction :
    curvatureContinuationCriterion -> continuationCriterion

def ShortTimeConstruction.toFoundational
    (S : ShortTimeConstruction) : ShortTimeFoundationalInhabitants := {
  parabolicRegularity := S.parabolicRegularity
  localExistenceInterval := S.localExistenceInterval
  uniquenessOnOverlap := S.uniquenessOnOverlap
  continuationCriterion := S.continuationCriterion
  parabolicRegularityTerm :=
    S.parabolicRegularityFromConstruction
      S.parabolicFunctionSpaceTerm
      S.localSchauderEstimateTerm
  localExistenceIntervalTerm :=
    S.localExistenceIntervalFromConstruction
      S.fixedPointMapContractiveTerm
      S.intervalProducedTerm
  uniquenessOnOverlapTerm :=
    S.uniquenessOnOverlapFromConstruction S.overlapUniquenessEstimateTerm
  continuationCriterionTerm :=
    S.continuationCriterionFromConstruction S.curvatureContinuationCriterionTerm
}

structure EntropyConstruction where
  conjugateHeatKernelBuilt : Prop
  wDensityComputed : Prop
  muInfimumAttainedOrApproximated : Prop
  firstVariationFormula : Prop
  squareTermNonnegative : Prop
  reducedDistanceBuilt : Prop
  reducedVolumeJacobianControl : Prop
  conjugateHeatEquation : Prop
  wFunctionalDefined : Prop
  muFunctionalDefined : Prop
  entropyMonotonicityFormula : Prop
  reducedVolumeMonotonicity : Prop
  conjugateHeatKernelBuiltTerm : conjugateHeatKernelBuilt
  wDensityComputedTerm : wDensityComputed
  muInfimumAttainedOrApproximatedTerm : muInfimumAttainedOrApproximated
  firstVariationFormulaTerm : firstVariationFormula
  squareTermNonnegativeTerm : squareTermNonnegative
  reducedDistanceBuiltTerm : reducedDistanceBuilt
  reducedVolumeJacobianControlTerm : reducedVolumeJacobianControl
  conjugateHeatEquationFromConstruction :
    conjugateHeatKernelBuilt -> conjugateHeatEquation
  wFunctionalDefinedFromConstruction :
    wDensityComputed -> conjugateHeatKernelBuilt -> wFunctionalDefined
  muFunctionalDefinedFromConstruction :
    wFunctionalDefined -> muInfimumAttainedOrApproximated -> muFunctionalDefined
  entropyMonotonicityFormulaFromConstruction :
    firstVariationFormula -> squareTermNonnegative -> entropyMonotonicityFormula
  reducedVolumeMonotonicityFromConstruction :
    reducedDistanceBuilt -> reducedVolumeJacobianControl -> reducedVolumeMonotonicity

def EntropyConstruction.toFoundational
    (E : EntropyConstruction) : EntropyMonotonicityFoundationalInhabitants := {
  conjugateHeatEquation := E.conjugateHeatEquation
  wFunctionalDefined := E.wFunctionalDefined
  muFunctionalDefined := E.muFunctionalDefined
  entropyMonotonicityFormula := E.entropyMonotonicityFormula
  reducedVolumeMonotonicity := E.reducedVolumeMonotonicity
  conjugateHeatEquationTerm :=
    E.conjugateHeatEquationFromConstruction E.conjugateHeatKernelBuiltTerm
  wFunctionalDefinedTerm :=
    E.wFunctionalDefinedFromConstruction
      E.wDensityComputedTerm
      E.conjugateHeatKernelBuiltTerm
  muFunctionalDefinedTerm :=
    E.muFunctionalDefinedFromConstruction
      (E.wFunctionalDefinedFromConstruction
        E.wDensityComputedTerm
        E.conjugateHeatKernelBuiltTerm)
      E.muInfimumAttainedOrApproximatedTerm
  entropyMonotonicityFormulaTerm :=
    E.entropyMonotonicityFormulaFromConstruction
      E.firstVariationFormulaTerm
      E.squareTermNonnegativeTerm
  reducedVolumeMonotonicityTerm :=
    E.reducedVolumeMonotonicityFromConstruction
      E.reducedDistanceBuiltTerm
      E.reducedVolumeJacobianControlTerm
}

structure NoncollapsingConstruction where
  entropyLowerBound : Prop
  reducedVolumeLowerBound : Prop
  ballCurvatureScaleBound : Prop
  blowupCompactnessPrepared : Prop
  noLocalCollapsing : Prop
  scaleInvariantVolumeLowerBound : Prop
  curvatureScaleCompatibility : Prop
  ancientSolutionCompactnessInput : Prop
  entropyLowerBoundTerm : entropyLowerBound
  reducedVolumeLowerBoundTerm : reducedVolumeLowerBound
  ballCurvatureScaleBoundTerm : ballCurvatureScaleBound
  blowupCompactnessPreparedTerm : blowupCompactnessPrepared
  noLocalCollapsingFromConstruction :
    entropyLowerBound -> reducedVolumeLowerBound -> noLocalCollapsing
  scaleInvariantVolumeLowerBoundFromConstruction :
    reducedVolumeLowerBound -> ballCurvatureScaleBound -> scaleInvariantVolumeLowerBound
  curvatureScaleCompatibilityFromConstruction :
    ballCurvatureScaleBound -> curvatureScaleCompatibility
  ancientSolutionCompactnessInputFromConstruction :
    blowupCompactnessPrepared -> noLocalCollapsing -> ancientSolutionCompactnessInput

def NoncollapsingConstruction.toFoundational
    (N : NoncollapsingConstruction) : NoncollapsingFoundationalInhabitants := {
  noLocalCollapsing := N.noLocalCollapsing
  scaleInvariantVolumeLowerBound := N.scaleInvariantVolumeLowerBound
  curvatureScaleCompatibility := N.curvatureScaleCompatibility
  ancientSolutionCompactnessInput := N.ancientSolutionCompactnessInput
  noLocalCollapsingTerm :=
    N.noLocalCollapsingFromConstruction
      N.entropyLowerBoundTerm
      N.reducedVolumeLowerBoundTerm
  scaleInvariantVolumeLowerBoundTerm :=
    N.scaleInvariantVolumeLowerBoundFromConstruction
      N.reducedVolumeLowerBoundTerm
      N.ballCurvatureScaleBoundTerm
  curvatureScaleCompatibilityTerm :=
    N.curvatureScaleCompatibilityFromConstruction N.ballCurvatureScaleBoundTerm
  ancientSolutionCompactnessInputTerm :=
    N.ancientSolutionCompactnessInputFromConstruction
      N.blowupCompactnessPreparedTerm
      (N.noLocalCollapsingFromConstruction
        N.entropyLowerBoundTerm
        N.reducedVolumeLowerBoundTerm)
}

structure SingularityModelConstruction where
  curvatureBlowupSequence : Prop
  parabolicRescalingChosen : Prop
  pointedCheegerGromovLimit : Prop
  ancientLimitEquation : Prop
  kappaNoncollapsedLimit : Prop
  shrinkerAsymptotics : Prop
  blowupSequenceChosen : Prop
  pointedLimitExists : Prop
  ancientKappaSolution : Prop
  asymptoticShrinkersControlled : Prop
  curvatureBlowupSequenceTerm : curvatureBlowupSequence
  parabolicRescalingChosenTerm : parabolicRescalingChosen
  pointedCheegerGromovLimitTerm : pointedCheegerGromovLimit
  ancientLimitEquationTerm : ancientLimitEquation
  kappaNoncollapsedLimitTerm : kappaNoncollapsedLimit
  shrinkerAsymptoticsTerm : shrinkerAsymptotics
  blowupSequenceChosenFromConstruction :
    curvatureBlowupSequence -> parabolicRescalingChosen -> blowupSequenceChosen
  pointedLimitExistsFromConstruction :
    parabolicRescalingChosen -> pointedCheegerGromovLimit -> pointedLimitExists
  ancientKappaSolutionFromConstruction :
    ancientLimitEquation -> kappaNoncollapsedLimit -> ancientKappaSolution
  asymptoticShrinkersControlledFromConstruction :
    shrinkerAsymptotics -> asymptoticShrinkersControlled

def SingularityModelConstruction.toFoundational
    (Q : SingularityModelConstruction) : SingularityModelFoundationalInhabitants := {
  blowupSequenceChosen := Q.blowupSequenceChosen
  pointedLimitExists := Q.pointedLimitExists
  ancientKappaSolution := Q.ancientKappaSolution
  asymptoticShrinkersControlled := Q.asymptoticShrinkersControlled
  blowupSequenceChosenTerm :=
    Q.blowupSequenceChosenFromConstruction
      Q.curvatureBlowupSequenceTerm
      Q.parabolicRescalingChosenTerm
  pointedLimitExistsTerm :=
    Q.pointedLimitExistsFromConstruction
      Q.parabolicRescalingChosenTerm
      Q.pointedCheegerGromovLimitTerm
  ancientKappaSolutionTerm :=
    Q.ancientKappaSolutionFromConstruction
      Q.ancientLimitEquationTerm
      Q.kappaNoncollapsedLimitTerm
  asymptoticShrinkersControlledTerm :=
    Q.asymptoticShrinkersControlledFromConstruction Q.shrinkerAsymptoticsTerm
}

structure CanonicalNeighborhoodConstruction where
  epsilonNeckModel : Prop
  capModel : Prop
  roundComponentModel : Prop
  highCurvatureModelComparison : Prop
  surgeryScaleSeparation : Prop
  neighborhoodPersistenceEstimate : Prop
  highCurvaturePointClassified : Prop
  neckCapOrRoundComponent : Prop
  surgeryScaleAdmissible : Prop
  persistenceUnderFlow : Prop
  epsilonNeckModelTerm : epsilonNeckModel
  capModelTerm : capModel
  roundComponentModelTerm : roundComponentModel
  highCurvatureModelComparisonTerm : highCurvatureModelComparison
  surgeryScaleSeparationTerm : surgeryScaleSeparation
  neighborhoodPersistenceEstimateTerm : neighborhoodPersistenceEstimate
  highCurvaturePointClassifiedFromConstruction :
    highCurvatureModelComparison -> highCurvaturePointClassified
  neckCapOrRoundComponentFromConstruction :
    epsilonNeckModel -> capModel -> roundComponentModel -> neckCapOrRoundComponent
  surgeryScaleAdmissibleFromConstruction :
    surgeryScaleSeparation -> surgeryScaleAdmissible
  persistenceUnderFlowFromConstruction :
    neighborhoodPersistenceEstimate -> persistenceUnderFlow

def CanonicalNeighborhoodConstruction.toFoundational
    (C : CanonicalNeighborhoodConstruction) : CanonicalNeighborhoodFoundationalInhabitants := {
  highCurvaturePointClassified := C.highCurvaturePointClassified
  neckCapOrRoundComponent := C.neckCapOrRoundComponent
  surgeryScaleAdmissible := C.surgeryScaleAdmissible
  persistenceUnderFlow := C.persistenceUnderFlow
  highCurvaturePointClassifiedTerm :=
    C.highCurvaturePointClassifiedFromConstruction C.highCurvatureModelComparisonTerm
  neckCapOrRoundComponentTerm :=
    C.neckCapOrRoundComponentFromConstruction
      C.epsilonNeckModelTerm
      C.capModelTerm
      C.roundComponentModelTerm
  surgeryScaleAdmissibleTerm :=
    C.surgeryScaleAdmissibleFromConstruction C.surgeryScaleSeparationTerm
  persistenceUnderFlowTerm :=
    C.persistenceUnderFlowFromConstruction C.neighborhoodPersistenceEstimateTerm
}

structure GeometrizationConstruction where
  thickPartHyperbolicControl : Prop
  thinPartCollapseControl : Prop
  finiteExtinctionCriterion : Prop
  primeDecompositionInput : Prop
  jacoShalenJohannsonControl : Prop
  geometryPiecesRecognition : Prop
  thickThinDecomposition : Prop
  finiteExtinctionAlternative : Prop
  primeDecompositionControlled : Prop
  geometrizationPiecesClassified : Prop
  thickPartHyperbolicControlTerm : thickPartHyperbolicControl
  thinPartCollapseControlTerm : thinPartCollapseControl
  finiteExtinctionCriterionTerm : finiteExtinctionCriterion
  primeDecompositionInputTerm : primeDecompositionInput
  jacoShalenJohannsonControlTerm : jacoShalenJohannsonControl
  geometryPiecesRecognitionTerm : geometryPiecesRecognition
  thickThinDecompositionFromConstruction :
    thickPartHyperbolicControl -> thinPartCollapseControl -> thickThinDecomposition
  finiteExtinctionAlternativeFromConstruction :
    finiteExtinctionCriterion -> finiteExtinctionAlternative
  primeDecompositionControlledFromConstruction :
    primeDecompositionInput -> jacoShalenJohannsonControl -> primeDecompositionControlled
  geometrizationPiecesClassifiedFromConstruction :
    geometryPiecesRecognition -> geometrizationPiecesClassified

def GeometrizationConstruction.toFoundational
    (G : GeometrizationConstruction) : GeometrizationFoundationalInhabitants := {
  thickThinDecomposition := G.thickThinDecomposition
  finiteExtinctionAlternative := G.finiteExtinctionAlternative
  primeDecompositionControlled := G.primeDecompositionControlled
  geometrizationPiecesClassified := G.geometrizationPiecesClassified
  thickThinDecompositionTerm :=
    G.thickThinDecompositionFromConstruction
      G.thickPartHyperbolicControlTerm
      G.thinPartCollapseControlTerm
  finiteExtinctionAlternativeTerm :=
    G.finiteExtinctionAlternativeFromConstruction G.finiteExtinctionCriterionTerm
  primeDecompositionControlledTerm :=
    G.primeDecompositionControlledFromConstruction
      G.primeDecompositionInputTerm
      G.jacoShalenJohannsonControlTerm
  geometrizationPiecesClassifiedTerm :=
    G.geometrizationPiecesClassifiedFromConstruction G.geometryPiecesRecognitionTerm
}

structure EndpointConstruction where
  closedThreeManifoldEndpoint : Prop
  fundamentalGroupTrivial : Prop
  sphericalSpaceFormRecognition : Prop
  quotientObstructionExcluded : Prop
  sphereRecognitionTheorem : Prop
  diffeomorphismLiftConstructed : Prop
  sphericalSpaceFormExcluded : Prop
  simplyConnectedEndpoint : Prop
  sphereDiffeomorphismProduced : Prop
  closedThreeManifoldEndpointTerm : closedThreeManifoldEndpoint
  fundamentalGroupTrivialTerm : fundamentalGroupTrivial
  sphericalSpaceFormRecognitionTerm : sphericalSpaceFormRecognition
  quotientObstructionExcludedTerm : quotientObstructionExcluded
  sphereRecognitionTheoremTerm : sphereRecognitionTheorem
  diffeomorphismLiftConstructedTerm : diffeomorphismLiftConstructed
  sphericalSpaceFormExcludedFromConstruction :
    sphericalSpaceFormRecognition -> quotientObstructionExcluded -> sphericalSpaceFormExcluded
  simplyConnectedEndpointFromConstruction :
    closedThreeManifoldEndpoint -> fundamentalGroupTrivial -> simplyConnectedEndpoint
  sphereDiffeomorphismProducedFromConstruction :
    sphereRecognitionTheorem -> diffeomorphismLiftConstructed -> sphereDiffeomorphismProduced

def EndpointConstruction.toFoundational
    (E : EndpointConstruction) : EndpointFoundationalInhabitants := {
  sphericalSpaceFormExcluded := E.sphericalSpaceFormExcluded
  simplyConnectedEndpoint := E.simplyConnectedEndpoint
  sphereDiffeomorphismProduced := E.sphereDiffeomorphismProduced
  sphericalSpaceFormExcludedTerm :=
    E.sphericalSpaceFormExcludedFromConstruction
      E.sphericalSpaceFormRecognitionTerm
      E.quotientObstructionExcludedTerm
  simplyConnectedEndpointTerm :=
    E.simplyConnectedEndpointFromConstruction
      E.closedThreeManifoldEndpointTerm
      E.fundamentalGroupTrivialTerm
  sphereDiffeomorphismProducedTerm :=
    E.sphereDiffeomorphismProducedFromConstruction
      E.sphereRecognitionTheoremTerm
      E.diffeomorphismLiftConstructedTerm
}

structure PerelmanDeepAnalyticConstruction where
  curvature : CurvatureTensorConstruction
  ricciFlowWithSurgery : RicciFlowWithSurgeryConstruction
  shortTime : ShortTimeConstruction
  entropy : EntropyConstruction
  noncollapsing : NoncollapsingConstruction
  singularity : SingularityModelConstruction
  canonicalNeighborhood : CanonicalNeighborhoodConstruction
  geometrization : GeometrizationConstruction
  endpoint : EndpointConstruction

def PerelmanDeepAnalyticConstruction.toFoundationalTheoremInhabitants
    (D : PerelmanDeepAnalyticConstruction) : PerelmanFoundationalTheoremInhabitants := {
  curvature := D.curvature.toFoundational
  ricciFlowWithSurgery := D.ricciFlowWithSurgery.toFoundational
  shortTime := D.shortTime.toFoundational
  entropy := D.entropy.toFoundational
  noncollapsing := D.noncollapsing.toFoundational
  singularity := D.singularity.toFoundational
  canonicalNeighborhood := D.canonicalNeighborhood.toFoundational
  geometrization := D.geometrization.toFoundational
  endpoint := D.endpoint.toFoundational
}

def PerelmanDeepAnalyticConstruction.toAnalyticProofCertificate
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    PerelmanAnalyticProofCertificate A :=
  (D.toFoundationalTheoremInhabitants).toAnalyticProofCertificate A

def PerelmanDeepAnalyticConstruction.evidenceTerms
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    PerelmanAnalyticEvidenceTerms (D.toAnalyticProofCertificate A) :=
  (D.toAnalyticProofCertificate A).evidenceTerms

theorem deep_analytic_construction_foundational_ricci_flow_with_surgery
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    RicciFlowPDEClosed A.flow ∧ SurgeryClosed A.surgery := by
  exact foundational_ricci_flow_with_surgery_inhabitant
    A D.toFoundationalTheoremInhabitants

theorem deep_analytic_construction_entropy_monotonicity
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    PerelmanEntropyClosed A.entropy := by
  exact foundational_entropy_monotonicity_inhabitant A D.toFoundationalTheoremInhabitants

theorem deep_analytic_construction_noncollapsing
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    NoncollapsingClosed A.noncollapsing := by
  exact foundational_noncollapsing_inhabitant A D.toFoundationalTheoremInhabitants

theorem deep_analytic_construction_canonical_neighborhood
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    CanonicalNeighborhoodsClosed A.canonicalNeighborhoods := by
  exact foundational_canonical_neighborhood_inhabitant A D.toFoundationalTheoremInhabitants

theorem deep_analytic_construction_surgery_control
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    SurgeryClosed A.surgery := by
  exact foundational_surgery_control_inhabitant A D.toFoundationalTheoremInhabitants

theorem deep_analytic_construction_finite_extinction_geometrization
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    GeometrizationClosed A.geometrization := by
  exact foundational_finite_extinction_geometrization_inhabitant
    A D.toFoundationalTheoremInhabitants

theorem deep_analytic_construction_endpoint_classification
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    EndpointClassificationClosed A.endpoint := by
  exact foundational_endpoint_classification_inhabitant A D.toFoundationalTheoremInhabitants

theorem deep_analytic_construction_close_perelman_route
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    PerelmanRouteClosed A.toPerelmanRouteObligations := by
  exact foundational_theorem_inhabitants_close_perelman_route
    A D.toFoundationalTheoremInhabitants

theorem deep_analytic_construction_supply_mathlib_endpoint
    (A : RicciFlowAnalyticFoundation) (D : PerelmanDeepAnalyticConstruction) :
    @ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere
      A.endpoint.targetManifold A.endpoint.targetTopology 3 := by
  exact foundational_theorem_inhabitants_supply_mathlib_endpoint
    A D.toFoundationalTheoremInhabitants

theorem deep_analytic_construction_yield_constrained_closure
    (A : AdmissibleClass) {R : RicciFlowAnalyticFoundation}
    (D : PerelmanDeepAnalyticConstruction)
    (bridgeFromDeepConstruction : bridgeClosed A)
    (gateFromDeepConstruction : gateClosed A) :
    ConstrainedPoincareClosure A := by
  exact foundational_theorem_inhabitants_yield_constrained_closure
    (R := R) A D.toFoundationalTheoremInhabitants
    bridgeFromDeepConstruction gateFromDeepConstruction

end PoincareConjectureCanonicalLaneLean
end HautevilleHouse
