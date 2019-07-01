import UIKit

/// A class that contains a TableViewCell containing a skill name.
final class SkillsTableViewCell: UITableViewCell {
    /// A label containing the skill's name
    @IBOutlet weak var skillName: UILabel?
    /// A StackView containing images representing the level of the skill
    @IBOutlet weak var imageContainer: UIStackView?

    /// Removes all the images before using it again.
    override func prepareForReuse() {
        super.prepareForReuse()

        imageContainer?.removeAllSubviews()
    }

    /// A method that configures the view with the info from `Skill`
    /// - Parameter skill: A skill containing the name and skill's level.
    func configureWith(skill: Skill) {
        guard let skillName = self.skillName,
            let imageContainer = self.imageContainer else {
            return
        }

        skillName.text = skill.skill

        for level in SkillLevel.min.rawValue...SkillLevel.max.rawValue {
            let image: UIImageView = level > skill.rating ?
                UIImageView(image: UIImage(named: "empty")) :
                UIImageView(image: UIImage(named: "star"))

            image.clipsToBounds = true
            image.contentMode = .scaleAspectFit
            image.rasterizeWith(color: .primaryColor)

            imageContainer.addArrangedSubview(image)
        }
    }
}
