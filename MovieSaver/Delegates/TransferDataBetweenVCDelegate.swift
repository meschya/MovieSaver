import Foundation

protocol TransferDataBetweenVCDelegate: AnyObject {
    func transferMovieName(_ name: String)
    func transferMovieRating(_ rating: String)
    func transferMovieDate(_ date: Date)
    func transferMovieYouTube(_ url: URL)
}
